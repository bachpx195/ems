module ApplicationHelper
  def show_errors(object, field_name)
    if object.errors.any?
      if !object.errors.messages[field_name].blank?
        object.errors.messages[field_name]
      end
    end
  end

  def format_date_in_japan str
    year_str = t "admin.blog.table.year"
    month_str = t "admin.blog.table.month"
    day_str = t "admin.blog.table.day"
    unless str.nil?
      date = str.to_datetime
      date.strftime "%Y#{year_str}%m#{month_str}%d#{day_str}  %I:%M"
    end
  end

  def format_date_in_list str
    unless str.nil?
      date = str.to_datetime
      date.strftime "%Y.%m.%d"
    end
  end

  def show_index index, page = 1
    if page.nil?
      page = 1 
    end
    (page.to_i - 1)*10*2 + index.to_i + 1
  end

  def biglikes_count(count_action)
    if count_action['biglike']
      count_action['biglike']
    else
      0
    end
  end

  def likes_count(count_action)
    if count_action['like']
      count_action['like']
    else
      0
    end
  end

  def dislikes_count(count_action)
    if count_action['dislike']
      count_action['dislike']
    else
      0
    end
  end

  def bigdislikes_count(count_action)
    if count_action['bigdislike']
      count_action['bigdislike']
    else
      0
    end
  end

  def title_text str
    if str.eql? "blogs"
      "なるほどブログ"
    elsif str.eql? "authors"
      "ナルフォード先生のプロフィール"
    elsif str.eql? "users"
      "なるほどユーザー"
    else
      "トーク"
    end
  end
end
