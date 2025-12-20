program Mbanking;
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

procedure login(i:integer);
var pin:string;
begin
    repeat
        clrscr;
        write('Masukkan PIN: ');
        readln(pin);
    until pin = acc[i].PIN;
end;

procedure menu(i:integer);
var p:char;
begin
    repeat
        clrscr;
        writeln('=== MENU AKUN ===');
        writeln('User  : ', acc[i].username);
        writeln('Saldo : Rp', acc[i].balance);
        writeln;
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
        writeln('=== MBANKING ===');
        writeln('1. Register');
        writeln('2. Login');
        writeln('3. Keluar');
        write('Pilih: ');
        pilih := readkey;

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
