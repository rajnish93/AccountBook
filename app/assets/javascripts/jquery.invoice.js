(function(jQuery) {
  $.opt = {};
  jQuery.fn.invoicegst = function(options) {
    var ops = jQuery.extend({}, jQuery.fn.invoicegst.defaults, options);
    $.opt = ops;
    var inv = new invoicegst();
    inv.init();
    jQuery('body').on('cocoon:after-remove', function() {

      inv.init();
      console.log("After Remove");

      //event.preventDefault();
    });
    jQuery('body').on('keyup', function(e) {
      inv.init();
    });
    return this;
  };
}(jQuery));
function invoicegst() {
    self = this;
}

// function NumInWords (number) {
//   const first = ['','one ','two ','three ','four ', 'five ','six ','seven ','eight ','nine ','ten ','eleven ','twelve ','thirteen ','fourteen ','fifteen ','sixteen ','seventeen ','eighteen ','nineteen '];
//   const tens = ['', '', 'twenty','thirty','forty','fifty', 'sixty','seventy','eighty','ninety'];
//   const mad = ['', '','', ' thousand', 'million','billion','trillion'];
//   let word = ''+  'only';

//   for (let i = 0; i < mad.length; i++) {
//     let tempNumber = number%(100*Math.pow(1000,i));
//     if (Math.floor(tempNumber/Math.pow(1000,i)) !== 0) {
//       if (Math.floor(tempNumber/Math.pow(1000,i)) < 20) {
//         word = first[Math.floor(tempNumber/Math.pow(1000,i))] + mad[i] + ' ' + word;
//       } else {
//         word = tens[Math.floor(tempNumber/(10*Math.pow(1000,i)))]  + first[Math.floor(tempNumber/Math.pow(1000,i))%10] + mad[i] + ' ' + word;
//       }
//     }

//     tempNumber = number%(Math.pow(1000,i+1));
//     if (Math.floor(tempNumber/(100*Math.pow(1000,i))) !== 0) word = first[Math.floor(tempNumber/(100*Math.pow(1000,i)))] + mad[i] + 'hunderd ' + word;
//   }
//     return word;
// }

// function NumToWord(inputNumber) {
//     let str = new String(inputNumber)
//     let splt = str.split("");
//     let rev = splt.reverse();
//     const once = ['Zero', ' One', ' Two', ' Three', ' Four', ' Five', ' Six', ' Seven', ' Eight', ' Nine'];
//     const twos = ['Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen', ' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', ' Nineteen'];
//     const tens = ['', 'Ten', ' Twenty', ' Thirty', ' Forty', ' Fifty', ' Sixty', ' Seventy', ' Eighty', ' Ninety'];

//     numLength = rev.length;
//     let word = new Array();
//     let j = 0;

//     for (i = 0; i < numLength; i++) {
//         switch (i) {

//             case 0:
//                 if ((rev[i] == 0) || (rev[i + 1] == 1)) {
//                     word[j] = '';
//                 }
//                 else {
//                     word[j] = '' + once[rev[i]];
//                 }
//                 word[j] = word[j];
//                 break;

//             case 1:
//                 aboveTens();
//                 break;

//             case 2:
//                 if (rev[i] == 0) {
//                     word[j] = '';
//                 }
//                 else if ((rev[i - 1] == 0) || (rev[i - 2] == 0)) {
//                     word[j] = once[rev[i]] + " Hundred ";
//                 }
//                 else {
//                     word[j] = once[rev[i]] + " Hundred and";
//                 }
//                 break;

//             case 3:
//                 if (rev[i] == 0 || rev[i + 1] == 1) {
//                     word[j] = '';
//                 }
//                 else {
//                     word[j] = once[rev[i]];
//                 }
//                 if ((rev[i + 1] != 0) || (rev[i] > 0)) {
//                     word[j] = word[j] + " Thousand";
//                 }
//                 break;


//             case 4:
//                 aboveTens();
//                 break;

//             case 5:
//                 if ((rev[i] == 0) || (rev[i + 1] == 1)) {
//                     word[j] = '';
//                 }
//                 else {
//                     word[j] = once[rev[i]];
//                 }
//                 if (rev[i + 1] !== '0' || rev[i] > '0') {
//                     word[j] = word[j] + " Lakh";
//                 }

//                 break;

//             case 6:
//                 aboveTens();
//                 break;

//             case 7:
//                 if ((rev[i] == 0) || (rev[i + 1] == 1)) {
//                     word[j] = '';
//                 }
//                 else {
//                     word[j] = once[rev[i]];
//                 }
//                 if (rev[i + 1] !== '0' || rev[i] > '0') {
//                     word[j] = word[j] + " Crore";
//                 }
//                 break;

//             case 8:
//                 aboveTens();
//                 break;

//             //            This is optional.

//             //            case 9:
//             //                if ((rev[i] == 0) || (rev[i + 1] == 1)) {
//             //                    word[j] = '';
//             //                }
//             //                else {
//             //                    word[j] = once[rev[i]];
//             //                }
//             //                if (rev[i + 1] !== '0' || rev[i] > '0') {
//             //                    word[j] = word[j] + " Arab";
//             //                }
//             //                break;

//             //            case 10:
//             //                aboveTens();
//             //                break;

//             default: break;
//         }
//         j++;
//     }

//     function aboveTens() {
//         if (rev[i] == 0) { word[j] = ''; }
//         else if (rev[i] == 1) { word[j] = twos[rev[i - 1]]; }
//         else { word[j] = tens[rev[i]]; }
//     }

//     word.reverse();
//     let finalOutput = '';
//     for (let i = 0; i < numLength; i++) {
//         finalOutput = finalOutput + word[i];
//     }
//     return finalOutput;
// }



invoicegst.prototype = {
    constructor: invoicegst,

    init: function () {
        this.calcTotal();
        //this.igstTotal();

        this.calcTotalQty();
        this.calcSubtotal();
        this.calcSubIGST();
        this.calcSubCGST();
        this.calcSubSGST();
        this.calcGrandTotal();

    },

    /**
     * Calculate total price of an item.
     *
     * @returns {number}
     */
    calcTotal: function () {
         jQuery($.opt.parentClass).each(function (i) {
             var row = jQuery(this);
             var total = row.find($.opt.price).val() * row.find($.opt.qty).val();
             total = self.roundNumber(total, 2);
             var subigst = total * row.find($.opt.igst).val()/100
             var subcgst = total * row.find($.opt.cgst).val()/100
             var subsgst = total * row.find($.opt.sgst).val()/100
             subigst = self.roundNumber(subigst, 2);
             subcgst = self.roundNumber(subcgst, 2);
             subsgst = self.roundNumber(subsgst, 2);

             row.find($.opt.total).val(total);
             row.find($.opt.subigst).val(subigst);
             row.find($.opt.subcgst).val(subcgst);
             row.find($.opt.subsgst).val(subsgst);
         });

         return 1;
     },

/*     igstTotal: function () {
         jQuery($.opt.parentClass).each(function (i) {
             var row = jQuery(this);
             //this.calcTotal;
             var igst = row.find(total.val()) * row.find(igst.val())/100
             igst = self.roundNumber(igst, 2);

         });

         return 1;
     },
*/

    /***
     * Calculate total quantity of an order.
     *
     * @returns {number}
     */
    calcTotalQty: function () {
         var totalQty = 0;
         jQuery($.opt.qty).each(function (i) {
             var qty = jQuery(this).val();
             if (!isNaN(qty)) totalQty += Number(qty);
         });

         totalQty = self.roundNumber(totalQty, 2);

         jQuery($.opt.totalQty).val(totalQty);

         return 1;
     },

    /***
     * Calculate subtotal of an order.
     *
     * @returns {number}
     */
    calcSubtotal: function () {
         var subtotal = 0;
         jQuery($.opt.total).each(function (i) {

             var total = jQuery(this).val();
             if (!isNaN(total)) subtotal += Number(total);
         });

         subtotal = self.roundNumber(subtotal, 2);


         jQuery($.opt.subtotal).val(subtotal);

         return 1;
     },

   calcSubIGST: function () {
         var totaligst =0;
        jQuery($.opt.subigst).each(function (i) {
             var subigst = jQuery(this).val();
             if (!isNaN(subigst)) totaligst += Number(subigst);
         });

         totaligst = self.roundNumber(totaligst, 2);

         jQuery($.opt.totaligst).val(totaligst);

         return 1;
     },


     calcSubCGST: function () {
         var totalcgst =0;
        jQuery($.opt.subcgst).each(function (i) {
             var subcgst = jQuery(this).val();
             if (!isNaN(subcgst)) totalcgst += Number(subcgst);
         });

         totalcgst = self.roundNumber(totalcgst, 2);

         jQuery($.opt.totalcgst).val(totalcgst);

         return 1;
     },


     calcSubSGST: function () {
         var totalsgst =0;
        jQuery($.opt.subsgst).each(function (i) {
             var subsgst = jQuery(this).val();
             if (!isNaN(subsgst)) totalsgst += Number(subsgst);
         });

         totalsgst = self.roundNumber(totalsgst, 2);

         jQuery($.opt.totalsgst).val(totalsgst);

         return totalsgst;
     },


    /**
     * Calculate grand total of an order.
     *
     * @returns {number}
     */
    calcGrandTotal: function () {
        var grandTotal = Number(jQuery($.opt.subtotal).val())
                       + Number(jQuery($.opt.shipping).val())
                       + Number(jQuery($.opt.totaligst).val())
                       + Number(jQuery($.opt.totalsgst).val())
                       + Number(jQuery($.opt.totalcgst).val())
                       - Number(jQuery($.opt.discount).val());
        grandTotal = self.roundNumber(grandTotal, 2);

        jQuery($.opt.grandTotal).val(grandTotal);
        jQuery($.opt.billAmount).val(grandTotal);
       // jQuery($.opt.wo).html(NumInWords(grandTotal));
        //jQuery($.opt.wo).html(NumToWord(grandTotal));


        return 1;
    },



    /**
     * Add a row.
     *
     * @returns {number}
     */
    // newRow: function () {
    //     jQuery(".item-row:last").after('<tr class="item-row"><td class="item-name"><div class="remove_record-btn"><input type="text" class="form-control item" placeholder="Item" type="text"><a class=' + $.opt.delete.substring(1) + ' href="javascript:;" title="Remove row">X</a></div></td><td><input class="form-control hsn" placeholder="HSN" type="text"> </td><td><input class="form-control batch" placeholder="Batch" type="text"> </td><td><input class="form-control uom" placeholder="UOM" type="text"> </td><td><input class="form-control exp" placeholder="Expiry" type="text"> </td><td><input class="form-control price" placeholder="Rate" type="text"> </td><td><input class="form-control qty" placeholder="Quantity" type="text"></td><td><input class="form-control igst" placeholder="IGST" type="text"> </td><td><input class="form-control cgst" placeholder="CGST" type="text"> </td><td><input class="form-control sgst" placeholder="SGST" type="text"> </td><td  style="display:none"><span class="subigst">
    //</span></td><td  style="display:none"><span class="subcgst"></span></td><td  style="display:none"><span class="subsgst"></span></td><td><span class="total"></span></td></tr>');
    //
    //     if (jQuery($.opt.delete).length > 0) {
    //         jQuery($.opt.delete).show();
    //     }
    //
    //     return 1;
    // },

    /**
     * Delete a row.
     *
     * @param elem   current element
     * @returns {number}
     */
     //$(this).prev('input[type=hidden]').val('1');
     //   $(this).closest('tr').hide();
     //   return event.preventDefault();

    // remove_recordRow: function(event) {
    //
    //     jQuery(event).parents($.opt.parentClass).remove();
    //
    //     if (jQuery($.opt.remove_record).length < 1) {
    //         jQuery(event).prev(input[ty]).val('1');
    //         jQuery($.opt.remove_record).remove();
    //
    //     }
    //
    //     return 1;
    //
    //
    // },
//     remove_recordRow: function(event) {
//
//  return 1;
// },


    /**
     * Round a number.
     * Using: http://www.mediacollege.com/internet/javascript/number/round.html
     *
     * @param number
     * @param decimals
     * @returns {*}
     */
    roundNumber: function (number, decimals) {
        var newString;// The new rounded number
        decimals = Number(decimals);

        if (decimals < 1) {
            newString = (Math.round(number)).toString();
        } else {
            var numString = number.toString();

            if (numString.lastIndexOf(".") == -1) {// If there is no decimal point
                numString += ".";// give it one at the end
            }

            var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number
            var d1 = Number(numString.substring(cutoff, cutoff + 1));// The value of the last decimal place that we'll end up with
            var d2 = Number(numString.substring(cutoff + 1, cutoff + 2));// The next decimal, after the last one we want

            if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated
                if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point
                    while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
                        if (d1 != ".") {
                            cutoff -= 1;
                            d1 = Number(numString.substring(cutoff, cutoff + 1));
                        } else {
                            cutoff -= 1;
                        }
                    }
                }

                d1 += 1;
            }

            if (d1 == 10) {
                numString = numString.substring(0, numString.lastIndexOf("."));
                var roundedNum = Number(numString) + 1;
                newString = roundedNum.toString() + '.';
            } else {
                newString = numString.substring(0, cutoff) + d1.toString();
            }
        }

        if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string
            newString += ".";
        }

        var decs = (newString.substring(newString.lastIndexOf(".") + 1)).length;

        for (var i = 0; i < decimals - decs; i++)
            newString += "0";
        //var newNumber = Number(newString);// make it a number if you like

        return newString; // Output the result to the form field (change for your purposes)
    }
};

/**
 *  Publicly accessible defaults.
 */
jQuery.fn.invoicegst.defaults = {
                //addRow : ".addRow",
                //remove_record : ".remove_record",
                parentClass: ".nested-fields",
                fields: ".fields",
                //parentClass : ".add_fields",
                //hidden_box: ".hidden_box",
                price : ".price",
                qty : ".qty",
                igst: ".igst",
                cgst: ".cgst",
                sgst: ".sgst",
                total : ".total",
                subigst : ".subigst",
                subcgst : ".subcgst",
                subsgst : ".subsgst",
                totaligst: "#totaligst",
                totalcgst: "#totalcgst",
                totalsgst: "#totalsgst",
                totalQty: "#totalQty",
                subtotal : "#subtotal",
                discount: "#discount",
                shipping : "#shipping",
                grandTotal : "#grandTotal",
                billAmount :'#billAmount',
              //  wo:"#wo"
};
