package dto;

public class CalculateInfo {

    public String when;
    public String types;
    public Integer money;
    public Integer percentage;
    public double return_money;

    public CalculateInfo() {
    }

    public CalculateInfo(String when, String types, Integer money, Integer percentage, double return_money) {
        this.when = when;
        this.types = types;
        this.money = money;
        this.percentage = percentage;
        this.return_money = return_money;
    }

    public String getWhen() {
        return when;
    }

    public void setWhen(String when) {
        this.when = when;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Integer getPercentage() {
        return percentage;
    }

    public void setPercentage(Integer percentage) {
        this.percentage = percentage;
    }

    public double getReturn_money() {
        return return_money;
    }

    public void setReturn_money(double return_money) {
        this.return_money = return_money;
    }
}
