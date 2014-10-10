class Upload < ActiveRecord::Base
  mount_uploader :file, FileUploader


  has_many :payments, dependent: :destroy
  after_create :parse_the_content



  def parse_the_content
    workbook = Roo::Excelx.new(File.join(self.file.file.path))
    workbook.default_sheet = workbook.sheets[0]
    headers = Hash.new
    workbook.row(1).each_with_index { |header,i| headers[header] = i }
    total_rows = ((workbook.first_row + 1)..workbook.last_row).count.to_s
    p "Total Rows: " + total_rows
    ((workbook.first_row + 1)..workbook.last_row).each_with_index do |row, index|
      begin
        payment = Payment.new
        p payment.invoice_date                =  workbook.row(row)[headers['Invoice Date']]
        p payment.due_date                    =  workbook.row(row)[headers['Due Date']]
        p payment.partner                     =  workbook.row(row)[headers['Partner#']]
        p payment.merchant_name               =  workbook.row(row)[headers['Merchant Name']]
        p payment.account_manager             =  workbook.row(row)[headers['Account Manager']]
        p payment.city                        =  workbook.row(row)[headers['City']]
        p payment.salesforce_contract_number  =  workbook.row(row)[headers['Salesforce Contract Number']]
        p payment.salesforce_id               =  workbook.row(row)[headers['Salesforce ID']]
        p payment.payment_terms               =  workbook.row(row)[headers['Payment Terms']]
        p payment.payment_terms_on_schedule   =  workbook.row(row)[headers['Payment Terms on schedule']]
        p payment.deal_id                     =  workbook.row(row)[headers['Deal ID']]
        p payment.gl_invoice_id               =  workbook.row(row)[headers['GL Invoice ID']]
        p payment.gl_status                   =  workbook.row(row)[headers['GL Status']]
        p payment.reason_code                 =  workbook.row(row)[headers['Reason Code']]
        p payment.amount                      =  workbook.row(row)[headers['Amount']]
        p payment.collected_quantity          =  workbook.row(row)[headers['Collected Quantity']]
        p payment.redeemed_quantity           =  workbook.row(row)[headers['Redeemed Quantity']]
        p payment.consumer_price              =  workbook.row(row)[headers['Consumer price']]
        p payment.unit_price                  =  workbook.row(row)[headers['unit price']]
        p payment.vat                         =  workbook.row(row)[headers['vat']]
        p payment.cda                         =  workbook.row(row)[headers['CDA']]
        p payment.merchant_pays_vat           =  workbook.row(row)[headers['Merchant Pays VAT']]
        p payment.vat_exemption               =  workbook.row(row)[headers['vat exemption']]
        p payment.voucher_count_in_invoice    =  workbook.row(row)[headers['voucher count in invoice']]
        p payment.payment_status              =  workbook.row(row)[headers['Payment status']]
        p payment.payment_date                =  workbook.row(row)[headers['Payment Date']]
        p payment.amount_adjusted             =  workbook.row(row)[headers['Amount Adjusted']]
        p payment.amount_paid                 =  workbook.row(row)[headers['Amount Paid']]
        p payment.issue                       =  workbook.row(row)[headers['Issue']]
        p payment.issue_date                  =  workbook.row(row)[headers['Issue Date']]
        p payment.issue_status                =  workbook.row(row)[headers['Issue Status']]
        p payment.how_resolved                =  workbook.row(row)[headers['How resolved']]
        p payment.txn_reference               =  workbook.row(row)[headers['Txn Reference']]
        payment.upload_id = self.id
        payment.save
        p "------------------------------------------------"
      rescue Exception => e
        p e
        p "-----------------Exception-------------------------------"
        next
      end
    end
  end

  #handle_asynchronously :parse_the_content


end


