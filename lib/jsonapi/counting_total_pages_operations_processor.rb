class CountingTotalPagesOperationsProcessor < ActiveRecordOperationsProcessor
  after_find_operation do
    @total_pages = @operation.options[:context][:total_pages]
    @operation_meta[:total_pages] = @total_pages if @total_pages.present?
  end
end