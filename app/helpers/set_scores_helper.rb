module SetScoresHelper
    def render_dropdowns(activity, form)
        options = []
        if (activity == "60m")
            8.times do |n|
                option = content_tag(:option, n, value: n)
                options.push(option)
            end
        else
            4.times do |n|
                option = content_tag(:option, n, value: n)
                options.push(option)
            end
        end
    content_tag(:select, options.join.html_safe, id: form)
    end         
end