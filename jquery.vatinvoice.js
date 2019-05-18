(function (jQuery) {
  $.opt = {};  // jQuery Object

    jQuery.fn.invoice = function (options) {
        var ops = jQuery.extend({}, jQuery.fn.invoice.defaults, options);
        $.opt = ops;

        var inv = new Invoice();
        inv.init();

        jQuery('body').on('keyup', function (e) {
            inv.init();
        });

        return this;
    };
}(jQuery));

function Invoice() {
    self = this;
}



Invoice.prototype = {
    constructor: Invoice,

    init: function () {
        this.calcTotal();
        this.calcTotalQty();
        this.calcSubtotal();
        this.calcSubCC();
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
             var subcc = row.find($.opt.price).val() * row.find($.opt.free).val();
             subcc = self.roundNumber(subcc, 2);

             row.find($.opt.total).val(total);
             row.find($.opt.subcc).val(subcc);
         });

         return 1;
     },



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



     calcSubCC: function () {
         var totalcc =0;
        jQuery($.opt.subcc).each(function (i) {
             var subcc = jQuery(this).val();
             if (!isNaN(subcc)) totalcc += Number(subcc);
         });

         totalcc = self.roundNumber(totalcc, 2);
         ccadd = totalcc * (Number(jQuery($.opt.cpercent).val())/100)
         jQuery($.opt.totalcc).val(totalcc);
         jQuery($.opt.ccadd).val(ccadd);

         return 1;
     },
    /**
     * Calculate grand total of an order.
     *
     * @returns {number}
     */
    calcGrandTotal: function () {
        var grandTotal = Number(jQuery($.opt.subtotal).val())
                       + Number(jQuery($.opt.shipping).val())
                       + Number(jQuery($.opt.ccadd).val())
                       - Number(jQuery($.opt.discount).val());
        grandTotal = self.roundNumber(grandTotal, 2);

        jQuery($.opt.grandTotal).val(grandTotal);




        return 1;
    },









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
jQuery.fn.invoice.defaults = {
                parentClass : ".add_fields",

                price : ".price",
                qty : ".qty",
                free: ".free",
                total : ".total",
                subcc : ".subcc",
                totalcc: "#totalcc",
                totalQty: "#totalQty",
                subtotal : "#subtotal",
                discount: "#discount",
                shipping : "#shipping",
                cpercent:"#cpercent",
                ccadd : "#ccadd",
                grandTotal : "#grandTotal",
              //  wo:"#wo"
};
