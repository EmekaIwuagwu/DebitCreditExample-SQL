
ALTER PROCEDURE DebitCr (
    @AccountNumber1 varchar(50) = null,
    @AccountNumber2 varchar(50) = null,
    @amount money = null

) AS 
BEGIN
    SET NOCOUNT ON;

    UPDATE account_Balances
        SET balance = COALESCE(balance, 0) - COALESCE(@amount, 0)
        WHERE AccountNumber = @AccountNumber1;

    UPDATE account_Balances
        SET balance = COALESCE(balance, 0) + COALESCE(@amount, 0)
        WHERE AccountNumber = @AccountNumber2;
END;
GO


---


EXEC DebitCr
@AccountNumber1 = '0023889098',
@AccountNumber2 = '0023889133',
@amount = 15000


22Suarez**