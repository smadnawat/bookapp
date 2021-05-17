module BooksHelper
	def book_error_messages!
	  return '' if @book.errors.empty?

	  messages = @book.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
	  sentence = I18n.t('errors.messages.not_saved',
	    count: @book.errors.count,
	    resource: "books")

	  html = <<-HTML
	  <div class="alert alert-danger alert-block">
	    <button type="button" class="close" data-dismiss="alert">x</button>
	    <h5>#{sentence}</h4>
	    #{messages}
	  </div>
	  HTML

	  html.html_safe
	end
end
