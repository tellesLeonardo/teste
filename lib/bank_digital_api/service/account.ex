defmodule BankDigitalApi.Service.Account do
  @moduledoc """
    O service é responsavél para controlar a logica e querys referente as contas
  """
  import Ecto.Query, warn: false
  alias BankDigitalApi.Repo
  alias BankDigitalApi.Schemas.Account

  @doc """
    Retorna todas as contas de usuário
  """
  def list_accounts do
    Repo.all(Account)
  end

  @doc """
    Retorna uma conta de usuário pelo número da conta
  """
  def get_account!(account_number), do: Repo.get!(Account, account_number)

  @doc """
    Cria uma nova conta de usuário
  """
  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
    Atualiza uma conta de usuário
  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    Deleta uma conta de usuário
  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
    Retorna uma changeset para rastreamento de mudanças
  """
  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end
end
