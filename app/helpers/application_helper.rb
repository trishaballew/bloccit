module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def down_vote_link_classes(post)
    #"glyphicon glyphicon-chevron-down "
    #current_user.voted(post)
    # "voted" if vote && vote.down_vote?
  end

  def up_vote_link_classes(post)
  #"glyphicon glyphicon-chevron-up "
  #current_user.voted(post)
  #"voted" if vote && vote.up_vote?
  end

end
