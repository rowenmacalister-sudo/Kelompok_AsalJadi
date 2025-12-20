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
