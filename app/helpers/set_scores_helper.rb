module SetScoresHelper
    def render_dropdowns(id, form, value)
        options = [
            add_option_tag("1", 20, value),
            add_option_tag("2", 15, value),
            add_option_tag("3", 10, value),
            add_option_tag("4", 5, value),
            add_option_tag("Nothing", 0, value)
        ]
    content_tag(:select, options.join.html_safe, name: form, id: id)
    end

    private
    def add_option_tag(name, value, dataToCheckAgainst)
        if value == dataToCheckAgainst
            content_tag(:option, name, value: value, selected: true)
        else
            content_tag(:option, name, value: value)
        end
    end
end