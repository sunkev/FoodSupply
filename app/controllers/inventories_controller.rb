class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:new]

  def new
  end

  def create
    @inventory = Inventory.new(inventory_params)
    if @inventory.save!
      redirect_to new_inventory_path
      flash[notice] = "Inventory was created!"
    else
      render new_inventory_path
      flash[notice] = "Inventory was not created!"
    end
  end

  private

  def set_inventory
    @inventory = Inventory.new
  end

  def inventory_params
    params.require(:inventory).permit(:title, :description, :quantity)
  end
end
