module SubmissionsHelper
  def list_group_class_for_score(score)
    if score.blank?
      "list-group-item-warning"
    elsif score <= 0
      "list-group-item-danger"
    elsif score <= 1
      "list-group-item-info"
    else
      "list-group-item-success"
    end
  end
end
