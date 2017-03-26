class DocsController < ApplicationController

  def add_docs
    Doc.add_docs
    redirect_to docs_path
  end

  def index
    @docs = Doc.all 
  end

  def show
    @doc = Doc.find_by_id(params[:id])
    doc_full_path = Rails.root + "assets/resources/docs" + @doc.name
    send_file(doc_full_path, :filename => "@doc.name.gsub('.doc','')", :disposition => 'inline', :type => "application/doc")
  end

  def new
    @doc = Doc.new 
  end

  def create
    @doc = Doc.new(doc_params)
    if @doc.save
      flash[:message] = 'Doc created.'
      redirect_to doc_path(@doc)
    else
      render :new
    end
  end

  def edit
    @doc = Doc.find_by_id(params[:id])
  end

  def update
    @doc = Doc.find_by_id(params[:id])
    @doc.update(doc_params)
    if @doc.save
      flash[:message] = 'Doc updated.'
      redirect_to doc_path(@doc)
    else
      render :edit
    end
  end

  def destroy
    @doc = Doc.find_by_id(params[:id])
    @doc.destroy
    redirect_to docs_path
  end

  private

  def doc_params
    params.require(:doc).permit(:name, :location, :description, :tags)
  end
end
