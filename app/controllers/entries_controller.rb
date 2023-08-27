class EntriesController < ApplicationController

    def index
      @entries = Entry.all
    end

    def new
      @entry = Entry.new
    end

    def create
      @entry = Entry.new(entry_params)
      if @entry.save
        redirect_to root_path, notice: '記録が正常に保存されました。'
      else
        render :new
      end
    end
  
    private
    def entry_params
      params.require(:entry).permit(:title, :photo, :text)
    end

end
