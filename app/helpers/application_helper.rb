module ApplicationHelper
    def markdown(text)
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            strikethrough: true,
            lax_html_blocks: true,
            superscript: true
        }
        Redcarpet::Markdown.new(renderer, options).render(text).html_safe
    end
end
