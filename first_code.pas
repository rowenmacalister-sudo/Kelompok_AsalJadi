program Mbanking;
uses crt, SysUtils, second_code;
procedure regis;
begin
    if t_acc = 3 then
    begin
        writeln('Maksimum 3 akun.');
        readln;
        exit;
    end;
    inc(t_acc);
    clrscr;
    with acc[t_acc]) do
    begin
        write('Masukkan username: '); readln(username);
        write('Masukkan PIN: '); readln(PIN);
        balance := 0;
        history_c := 0;
    end;
    writeln('Akun berhasil dibuat!');
    readln;
end;

procedure login(i : integer);
var temp : string;
begin
    repeat
    clrscr;
    writeln('=== LOGIN ', acc[i].username, ' ===');
    write('masukkan PIN: '); readln(temp);
    if temp <> acc[i].PIN then write('PIN salah'); readln;
    until temp = acc[i].PIN;
end;

procedure menu(i:integer);
var p:char;
begin
    repeat
        clrscr;
        with acc[i] do
        begin
        writeln('==== MENU AKUN ====');
        writeln('User  : ', username);
        writeln('Saldo : Rp', balance);
        end;
        writeln('1. Deposit');
        writeln('2. Withdraw');
        writeln('3. Riwayat');
        writeln('4. Logout');
        write('Pilih: ');
        p := readkey;
        case p of
            '1': deposit(i);
            '2': withdraw(i);
            '3': showhis(i);
        end;
    until p = '4';
end;

var pilih:char; idx:integer;
begin
    t_acc := 0;
    repeat
        clrscr;
        writeln('===== MBANKING =====');
        writeln('1.   Register');
        writeln('2.   Login');
        writeln('3.   Keluar');
        write('Pilih: '); pilih := readkey;
        case pilih of
            '1': regis;
            '2': begin
                    idx := pilihAkun;
                    if idx <> -1 then
                    begin
                        login(idx);
                        menu(idx);
                    end;
                 end;
        end;
    until pilih = '3';
end.
