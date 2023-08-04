class EntriesController < ApplicationController
  def index
    @entries = Entry.all

    if params[:search].present?
      @entries = @entries.where("name LIKE ?", "%#{params[:search]}%")
    end

    if params[:sort_by] == 'date_desc'
      @entries = @entries.order(date: :desc)
    elsif params[:sort_by] == 'date_asc'
      @entries = @entries.order(date: :asc)
    end

    if @entries.empty?
      flash.now[:notice] = "No entries found"
    end
  end


  
    def new
      @entry = Entry.new
    end
  
    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        flash[:notice] = "Entry created successfully!"
        redirect_to entries_path
      else
        flash[:alert] = "Error creating entry."
        @entries = Entry.all
        render :index
      end
    end
  
    def edit
      @entry = Entry.find(params[:id])
    end

    def show
      @entry = Entry.find(params[:id])
    end
  
    def update
      @entry = Entry.find(params[:id])
      if @entry.update(entry_params)
        redirect_to entries_path
      else
        render :edit
      end
    end
  
    def destroy
      entry = Entry.find(params[:id])
      entry.destroy
      flash[:notice] = "Entry deleted successfully!"
      redirect_to entries_path
    end
  
    private
  
    def entry_params
      params.require(:entry).permit(:name, :description, :activity_type, :mood_scale, :link, :date, :time, :image)
    end
  end
  
  
  
  


