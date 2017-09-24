class BillsController < ApplicationController
  
  def expenses
    @purchase = Purchase.new
    @user = current_user
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
       splitter_ids = params[:purchase][:user_ids]
       Debt.calculate_debths(splitter_ids,@purchase.id)
       redirect_to debt_path
    else
       render :expenses 
    end
  end

  def debt
    @debts = Hash.new
    @debts = {}
    @user = current_user
    if user_signed_in?
      @debts = Debt.debt_owed(@user)
    end
    @user_debts = Debt.where(debtor: @user)
    @user_credits = Debt.where(creditor: @user)
    @filtered_debts = @user_debts.find_all{
      |debt| debt.creditor.username != current_user.username 
    }
    @filtered_credits = @user_credits.find_all {
      |credit| credit.debtor.username != current_user.username
    }
  end

  def edit_debt 
    Debt.delete(params[:id])
    redirect_to request.referrer
  end

  private

  def purchase_params
    params.require(:purchase).permit(:cost, :event_id, :user_id, :date_purchased, :location, :user_ids => []).merge(user_id: current_user.id)
  end
end
