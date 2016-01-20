module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def form_errors_for(object=nil)
    render('shared/form_errors', object: object) unless object.blank?
  end

end
