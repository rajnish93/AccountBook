module ProductpurchasegstsHelper
  def load_igst1
    Taxrate.map { |taxrate| [taxrate.rktaxname, taxrate.id, {'data-igst_1' => taxrate.rktaxpercent}] }
  end

  def load_cgst2
    Taxrate.map { |taxrate| [taxrate.rktaxname, taxrate.id, {'data-tax_2' => taxrate.rktaxpercent}] }
  end
  def load_sgst3
    Taxrate.map { |taxrate| [taxrate.rktaxname, taxrate.id, {'data-tax_3' => taxrate.rktaxpercent}] }
  end

  def load_line_item_igst1(att)
    if att.igst_1.present?

      load_igst1
    end
    #line_item.tax1.present? ? taxes.prepend([line_item.tax1.name, line_item.tax1.id, {'data-type' => 'active_line_item_tax','data-tax_1' => line_item.tax1.percentage }]) : taxes
  end

end
