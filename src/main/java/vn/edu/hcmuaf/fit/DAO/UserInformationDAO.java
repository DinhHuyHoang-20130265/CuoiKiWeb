package vn.edu.hcmuaf.fit.DAO;
import vn.edu.hcmuaf.fit.beans.UserInformation;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import java.util.List;
import java.util.stream.Collectors;
public class UserInformationDAO {
    private List<UserInformation> listUserInfo;
    public List<UserInformation> loadUserInfo(){
        return listUserInfo = JDBIConnector.get().withHandle(handle -> handle.createQuery("SELECT * FROM account_information ")
                .mapToBean(UserInformation.class)
                .stream()
                .collect(Collectors.toList()));
    }
    public static void main(String[] args) {
        System.out.println(new UserInformationDAO().loadUserInfo());
    }
}