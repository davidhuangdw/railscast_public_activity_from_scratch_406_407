class ActivityDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def render_activity
    h.render partial_path, activity:self
  end

  def partial_path
    partial_paths.detect do |path|
      h.lookup_context.template_exists? path, nil, true
    end || raise("No partial found for activity in #{partial_paths}")
  end

  def partial_paths
    ["activities/#{trackable_type}/#{action.underscore}",
     "activities/#{trackable_type.underscore}",
     "activities/_activity",
     ]
  end



end
