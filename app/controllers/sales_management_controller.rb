# frozen_string_literal: true

class SalesManagementController < ApplicationController
  def index
    puts "デバッグ: SalesManagementController#indexが呼び出されました"
    @sales_data = Order.includes(:sale, :procurement, :sales_channel)
                      .includes(order_items: { sku: { sku_part_number_links: :product } })
                      .joins(:sale, :procurement, :sales_channel)
                      .joins(order_items: { sku: { sku_part_number_links: :product } })
                      .select(
                        'sales.price_jpy as price',
                        'skus.code as skus_code',
                        'products.oem_part_number',
                        'products.domestic_title',
                        'sales_channels.channel_name',
                        'procurements.purchase_price'
                      ).distinct
    debugger
    puts "デバッグ: SalesManagementController#indexが終了しました"
  end
end
