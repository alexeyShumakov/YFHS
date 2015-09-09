class OneBoxController < ApplicationController
  def show
    result = Onebox.preview(params[:url])
    if result.to_s.blank?
      render nothing: true, status: 404
    else
      if params[:preview] == 'true'
        render text: result.placeholder_html
      else
        render text: result
      end
    end
  end
end
