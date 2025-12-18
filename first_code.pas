program Mbanking;
uses crt, SysUtils, uType;

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

    write('Masukkan username: ');
    readln(acc[t_acc].username);

    write('Masukkan PIN: ');
    readln(acc[t_acc].PIN);

    acc[t_acc].balance := 0;
    acc[t_acc].history_c := 0;

    writeln('Akun berhasil dibuat!');
    readln;
end;
begin
    t_acc := 0;
    regis;
end.
