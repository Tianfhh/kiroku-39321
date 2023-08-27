class EntriesController < ApplicationController

    def index
      @entries = Entry.all
    end

    def new
      @entry = Entry.new
    end

    def create
      Entry.create(entry_params)
    end
  
    private
    def entry_params
      params.require(:entry).permit(:title, :photo, :text)
    end

end
