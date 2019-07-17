class ProgrammingLanguagesController < ApplicationController
  # before_action :set_programming_language, only: [:show, :edit, :update, :destroy]

  def index
    @programming_language = ProgrammingLanguage.new
    @programming_language.name = programming_language_params[:language]

    case programming_language_params[:my_type]

    # doing search with type. It can be: 1 - Name, Type - 2, Designed by - 3   
    when "1"
         @result = @programming_language.search_by_name
    when "2"
        @result = @programming_language.search_by_type
    when "3"
        @result = @programming_language.search_by_designed
    else
        @result = []
    end

    # check if present
    if (@result.present?)
      respond_to do |format|
          format.html { render "index", locals:{result: @result}, status: :ok }
      end
  end
  end



  def show_result
    # @programming_language = ProgrammingLanguage.new
    # @programming_language.name = programming_language_params[:language]
    #
    # case programming_language_params[:my_type]
    # when "1"
    #     @result = @programming_language.search_by_name
    # when "2"
    #     @result = @programming_language.search_by_type
    # when "3"
    #     @result = @programming_language.search_by_designed
    # else
    #     @result = []
    # end

    # binding.pry

    # respond_to do |format|
    #   format.json
    #   render :partial => "programming_languages/show_result.json"
    # end

    # render '/show_results'

    # redirect_to "/show_results"
    # format.json { render :json => { :redirect => @result } }
    #
    # render :json => { :attachmentPartial => render_to_string('programming_languages/show_result',
    #    :layout => false, :locals => { :result => @result }) }
    #
    # respond_to do |format|
    #   format.html { redirect_to @result, notice: 'Search successfully' }
    # end
  end

  private
  def programming_language_params
    params.permit(:language, :my_type)
  end
end
