module SetScoresHelper
    def render_dropdowns(activity, form, year, gender)
        event = Event.find_by(activity: activity, year: year, gender: gender)
        amountData = {
            turing: event.turing,
            sharman: event.sharman,
            winston: event.winston,
            ennis: event.ennis
        }
        options = []
        if (activity == "60m")
            8.times do |n|
                option = add_option_tag(n, n, amountData[form])
                options.push(option)
            end
        else
            4.times do |n|
                option = add_option_tag(n,n, amountData[form])
                options.push(option)
            end
        end
    content_tag(:select, options.join.html_safe, name: form)
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