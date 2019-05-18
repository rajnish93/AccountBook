$(function() {
  return $(document).on('change', '.product', function(evt) {
    return $.ajax('/productpurchasevats/update_batches', {
      type: 'GET',
      dataType: 'script',
      data: {
        product_id: $(".product option:selected").val()
      },
      error: function(jqXHR, textStatus, errorThrown) {
        return console.log(`AJAX Error: ${textStatus}`);
      },
      success: function(data, textStatus, jqXHR) {
        var i, j, len, ref, results;
        console.log("Dynamic product select OK!");
        console.log(data);
        ref = data.length;
        results = [];
        for (j = 0, len = ref.length; j < len; j++) {
          i = ref[j];
          results.push($(".productpurchasevat_purchproditemvats_attributes_1525678363173_batch_id").empty().append('<option value="' + data[i].id + '"' > ' + data[i].batch + </option> '));
        }
        return results;
      }
    });
  });
});
