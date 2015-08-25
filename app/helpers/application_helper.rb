module ApplicationHelper

  def full_title(page_title = '')
    base_title = 'ReqTree'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def log(str)
    puts "\n\n////////////////////////////////\n"
    puts "#{str}\n"
    puts "////////////////////////////////\n\n"
  end

  def body_class
    [params[:controller].split('/'), params[:action]].flatten.join(' ')
  end

end
