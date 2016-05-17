import com.jordiv.ajvt.Role
import com.jordiv.ajvt.User
import com.jordiv.ajvt.UserRole

class BootStrap {

    def init = { servletContext ->
      def adminRole = new Role('ROLE_ADMIN').save()
      def userRole = new Role('ROLE_USER').save()

      def testUser = new User('admin', 'admin1').save()

      UserRole.create testUser, adminRole

      UserRole.withSession {
         it.flush()
         it.clear()
      }

      assert User.count() == 1
      assert Role.count() == 2
      assert UserRole.count() == 1
    }
    def destroy = {
    }
}
