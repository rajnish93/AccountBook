module OrdersHelper
	def new_invoice id, is_draft
    message = is_draft ? "The invoice has been saved as draft." : "Invoice has been created"
    notice = <<-HTML
       <p>#{message}.</p>
       <ul>
         
         <li><a href="/invoices/new">Create another invoice</a></li>
         
         
       </ul>
    HTML
    notice.html_safe
  end

end

