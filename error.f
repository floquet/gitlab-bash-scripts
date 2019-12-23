module mod_types
        type :: type1
                real :: coo(3)
        end type

        type, extends(type1) :: type2
                logical :: boo
        end type

        contains

        subroutine sub1(arg)
                implicit none
                ! arguments
                class(type1),   allocatable, intent(in) :: arg(:)
                ! private variables
                integer :: i
                ! start work
                do i=1,size(arg)
                        print '(3f6.2)', arg(i)%coo
                enddo
        end subroutine sub1
end module mod_types

program hello
        use mod_types
        implicit none

        !type(type1), allocatable :: my_var(:)  ! with this line i get: If a dummy argument is allocatable or a pointer, the associated actual argument shall be polymorphic if and only if the dummy argument is polymorphic
        type(type2), allocatable :: my_var(:)   ! with this line i get: The type of the actual argument differs from the type of the dummy argument.
        integer :: i

        allocate(my_var(10))
        do i=1,10
                my_var(i)%coo = [0.0,0.0,0.0]
        enddo

        call sub1(my_var)

end program hello
