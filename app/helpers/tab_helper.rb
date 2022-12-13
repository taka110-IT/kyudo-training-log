module TabHelper
  def current_page_tab_or_not(target_name)
    current_page_tab?(target_name) ? 'active' : ''
  end

  private

  def current_page_tab?(target_name)
    paths = request.url.split('=')
    paths.push('all') unless paths.include?('all') || paths.include?('important')
    paths[-1] == target_name
  end
end
