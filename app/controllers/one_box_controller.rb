class OneBoxController < ApplicationController
  def show
    result = Onebox.preview(params[:url])
    if result.to_s.blank?
      render nothing: true, status: 404
    else
      render text: result.placeholder_html
    end
  end
end
