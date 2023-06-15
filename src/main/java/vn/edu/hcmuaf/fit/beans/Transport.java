package vn.edu.hcmuaf.fit.beans;

public class Transport {
    private String email;
    private String fromDistrictID;
    private String fromWardID;
    private String toDistrictID;
    private String toWardID;
    private int height;
    private int length;
    private int width;
    private int weight;
    private int fee;
    private long leadTime;
    private boolean active;
    private String id;
    private String updated_at;
    private String created_at;

    public Transport() {
    }

    public Transport(String email, String fromDistrictID, String fromWardID, String toDistrictID, String toWardID, int height, int length, int width, int weight, int fee, long leadTime, boolean active, String id, String updated_at, String created_at) {
        this.email = email;
        this.fromDistrictID = fromDistrictID;
        this.fromWardID = fromWardID;
        this.toDistrictID = toDistrictID;
        this.toWardID = toWardID;
        this.height = height;
        this.length = length;
        this.width = width;
        this.weight = weight;
        this.fee = fee;
        this.leadTime = leadTime;
        this.active = active;
        this.id = id;
        this.updated_at = updated_at;
        this.created_at = created_at;
    }

    @Override
    public String toString() {
        return "Transport{" +
                "email='" + email + '\'' +
                ", fromDistrictID='" + fromDistrictID + '\'' +
                ", fromWardID='" + fromWardID + '\'' +
                ", toDistrictID='" + toDistrictID + '\'' +
                ", toWardID='" + toWardID + '\'' +
                ", height=" + height +
                ", length=" + length +
                ", width=" + width +
                ", weight=" + weight +
                ", fee=" + fee +
                ", leadTime=" + leadTime +
                ", active=" + active +
                ", id='" + id + '\'' +
                ", updated_at='" + updated_at + '\'' +
                ", created_at='" + created_at + '\'' +
                '}';
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFromDistrictID() {
        return fromDistrictID;
    }

    public void setFromDistrictID(String fromDistrictID) {
        this.fromDistrictID = fromDistrictID;
    }

    public String getFromWardID() {
        return fromWardID;
    }

    public void setFromWardID(String fromWardID) {
        this.fromWardID = fromWardID;
    }

    public String getToDistrictID() {
        return toDistrictID;
    }

    public void setToDistrictID(String toDistrictID) {
        this.toDistrictID = toDistrictID;
    }

    public String getToWardID() {
        return toWardID;
    }

    public void setToWardID(String toWardID) {
        this.toWardID = toWardID;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public long getLeadTime() {
        return leadTime;
    }

    public void setLeadTime(long leadTime) {
        this.leadTime = leadTime;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
}
