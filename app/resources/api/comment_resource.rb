class Api::CommentResource < JSONAPI::Resource
  attributes :votes, :target_name, :evaluation_value, :body, :commentable_id, :commentable_type, :created_at
  has_one :user

  def self.records(options = {})
    params = options[:context][:params]
    if params[:user_id].present?
      @comments = Comment.includes(:commentable, :user).where user_id: params[:user_id]
    else
      @comments = Comment.includes(:commentable, :user).where commentable_type: params[:commentable_type], commentable_id: params[:commentable_id]
    end
    @comments = params[:page].blank? ? @comments.page(1) : @comments.page(params[:page])
    options[:context][:total_pages] = @comments.total_pages
    @comments
  end

  def self.updatable_fields(context)
    super - [:votes, :evaluation_value]
  end

  def self.creatable_fields(context)
    super - [:votes, :evaluation_value]
  end

  def evaluation_value
    if context[:current_user] && @model.has_evaluation?(:vote, context[:current_user])
      @model.evaluation_by :vote, context[:current_user]
    else
      0
    end
  end

  def votes
    @model.reputation_for :vote
  end
end
