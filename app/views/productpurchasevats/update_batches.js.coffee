$(".batch").empty().append("<%= escape_javascript(render(:partial => @batches)) %>")
