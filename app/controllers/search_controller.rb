class SearchController < ApplicationController
  def index
    sql = "SELECT 
            id,
            'article' as type,
            description,
            title, 
            created_at 
          from 
            articles 
          where
            title like '%#{params[:search]}%'

        union
         
          SELECT 
            id,
            'event' as type, 
            description,
            title, 
            created_at 
          from 
            events 
          where
            title like '%#{params[:search]}%'
            
        union

          SELECT 
            id,
            'oportunity' as type, 
            description,
            title, 
            created_at 
          from 
            oportunities 
          where
            title like '%#{params[:search]}%'

          order by 
            created_at desc";

    @results = Article.paginate_by_sql(sql, :page => params[:page], :per_page => 30);
  end

  def show
    begin
      @article = Article.find params[:id]
    rescue
      redirect_to not_found_path()
    end
  end

  def pathGenerator(resultObject)
    case resultObject.type.to_s
      when "article"
        result = "articles/" + resultObject.id.to_s;
      when "event"
        result = "events/" + resultObject.id.to_s;
      when "oportunity"
        result = "oportunities/" + resultObject.id.to_s;
    end
  end

  helper_method :pathGenerator
end


