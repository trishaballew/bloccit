class Topic < ActiveRecord::Base
     has_many :posts 

  def will_paginate
    @topics = Topic.paginate(page: params[:page], per_page: 10)
  end

end
