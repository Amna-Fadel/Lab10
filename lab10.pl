% ==========================================
% Task 1: Calculate Area and Perimeter (Square, Rectangle, Triangle)
% ==========================================

% --- Square ---
square_area(Side, Area) :-
    Area is Side * Side.

square_perimeter(Side, Perimeter) :-
    Perimeter is 4 * Side.

% --- Rectangle ---
rectangle_area(Width, Height, Area) :-
    Area is Width * Height.

rectangle_perimeter(Width, Height, Perimeter) :-
    Perimeter is 2 * (Width + Height).

% --- Triangle ---
triangle_area(Base, Height, Area) :-
    Area is 0.5 * Base * Height.

triangle_perimeter(A, B, C, Perimeter) :-
    Perimeter is A + B + C.




% ==========================================
% Task 2: Login System with Attempt Management
% ==========================================

% Dataset of valid users and passwords
credentials('admin', '1234').
credentials('student', 'prolog123').
credentials('ali', 'pass2026').

% Start the login process with 3 total attempts (1 initial + 2 more attempts)[cite: 1]
login :-
    write('=== Login Page ==='), nl,
    login_attempts(3).

% If maximum number of attempts exceeded
login_attempts(0) :-
    nl, write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.

% Verification function and attempts tracker
login_attempts(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (   credentials(Username, Password)
    ->  nl, write('Login Successful'), nl
    ;   nl, write('Login Unsuccessful'), nl,
        Remaining is Attempts - 1,
        (   Remaining > 0
        ->  format('You have ~w more attempt(s) remaining.~n', [Remaining]),
            login_attempts(Remaining)
        ;   login_attempts(0)
        )
    ).
