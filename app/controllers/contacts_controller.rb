class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  
  def index
    # @contacts = current_user.contacts
    @contacts = Contact.all
    # render json: @contacts
  end

  def show
    @contact_todos = Todo.all.where(contact_id: params[:contact_id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:message] = 'Contact created.'
      redirect_to contact_path(@contact)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @contact.update(contact_params)
    if @contact.save
      flash[:message] = 'Contact updated.'
      redirect_to contact_path(@contact)
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to root_path
  end

  private
  def set_contact
    @contact = Contact.find_by_id(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:org_id, :fname, :lname, :title, :email, :phone, :url, :about, :history)
  end
end
