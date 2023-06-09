module.exports = (sequelize, Sequelize) => {
    const Currency = sequelize.define(
      "Currency",
      {
        CurrencyID: {
          type: Sequelize.STRING(20),
          primaryKey: true,
        },
        ExchangeRate: {
          type: Sequelize.STRING(50),
          allowNull: false,
        },
      },
      { timestamps: false }
    );
  
    return Currency;
  };
  