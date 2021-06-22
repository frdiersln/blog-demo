class PagesController < ApplicationController
    def index
    redirect_to articles_path
    end
    
    def about
    end

end