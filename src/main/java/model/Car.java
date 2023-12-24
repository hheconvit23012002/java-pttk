package model;

public class Car {
	private int id;
	private String manufacturer;
	private String type;
	private int price;
	private String des;
	private String color;
	private String licenseOlate;
	
	public Car() {
		// TODO Auto-generated constructor stub
	}

	public Car(int id, String manufacturer, String type, int price, String des, String color, String licenseOlate) {
		super();
		this.id = id;
		this.manufacturer = manufacturer;
		this.type = type;
		this.price = price;
		this.des = des;
		this.color = color;
		this.licenseOlate = licenseOlate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getLicenseOlate() {
		return licenseOlate;
	}

	public void setLicenseOlate(String licenseOlate) {
		this.licenseOlate = licenseOlate;
	}
    @Override
    public boolean equals(Object obj) {
        boolean sameSame = false;

        if (obj != null && obj instanceof Car)
        {
            sameSame = this.id == ((Car) obj).id;
        }

        return sameSame;
    }
	
}
