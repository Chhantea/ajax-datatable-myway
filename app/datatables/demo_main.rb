class DemoMain
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Something.count,
      iTotalDisplayRecords: some.total_entries,
      aaData: data
    }
  end

private

  def data
    some.map do |s|
      [
       (s.name),
       (s.add),
       link_to("<i class='fa fa-eye' aria-hidden='true' style='margin-right:5px'></i>View".html_safe, {:controller => 'main', :area_id => s.id, method: :get}, :class => 'btn btn-primary')
      ]
    end
  end

  def some
    @some ||= fetch_some
  end

  def fetch_some
    some = Something.order("#{sort_column} #{sort_direction}")
    some = some.page(page).per_page(per_page)
    if params[:sSearch].present?
      some = some.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    some
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end