module Paginate

  def paginate(page, per_page)
    Resource.limit(10).offset(page * 10) do |relation_of_ten|
      #do_something_with(relation_of_ten)
    end
  end

end