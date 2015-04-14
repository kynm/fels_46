module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'FELS'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def create_add_answer_button name, f, answers
    new_object = f.object.class.reflect_on_association(answers).klass.new

    fields = f.fields_for answers, new_object, child_index: "new_#{answers}" do |builder|
      render answers.to_s.singularize + "_fields", f: builder
    end

    link_to(name, "javascript:void(0);",
      onclick: h("add_fields(this, \"#{answers}\", \"#{escape_javascript(fields)}\")"))
  end
end