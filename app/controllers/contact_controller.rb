class ContactController < ApplicationController
    def index
        @contacts = Contact.all
    end

    def show
        @contact = Contact.find(params[:id])
    end

    def new 
        @contact = Contact.new
    end

    def create
        @contact = Contact.new(params[:contact])
        if @contact.save!
            redirect_to :action => "index"
        else
            render :action => "new"
        end
    end

    def update 
        @contact = Contact.find(params[:id])
        @contact.attributes = params[:contact]
        @contact.save!
        redirect_to :action => "index"
    end
end
