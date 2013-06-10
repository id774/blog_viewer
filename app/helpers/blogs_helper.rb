# -*- coding: utf-8 -*-

module BlogsHelper
  def auto_link(text)
    raw Rinku.auto_link(h(text))
  end

  def cutoff_by_char(str, max_length = 140, footer = "...")
    arr_str = str.split(//)
    if arr_str.length > max_length
      return h(arr_str[0, max_length].join("") + footer)
    else
      return h(str)
    end
  end
end
