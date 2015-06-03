module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def down_vote_link_classes(post)
    class_base = "glyphicon glyphicon-chevron-down "
    vote = current_user.voted(post)
    class_base += "voted" if vote && vote.down_vote?
    class_base
  end

  def up_vote_link_classes(post)
    class_base = "glyphicon glyphicon-chevron-up "
    vote = current_user.voted(post)
    class_base = "voted" if vote && vote.up_vote?
    class_base
  end

end
