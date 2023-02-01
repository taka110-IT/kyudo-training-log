# frozen_string_literal: true

module TabHelper
  def current_page_tab_or_not(target_name)
    current_page_tab(target_name) ? 'active' : ''
  end

  private

  def current_page_tab(target_name)
    paths = request.url.split(/[=?&]/)
    active_tab = paths.include?('important') ? 'important' : 'all'
    active_tab == target_name
  end
end
