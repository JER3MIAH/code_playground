import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';

@Injectable()
export class UsersService {
  private users = [
    {
      id: 1,
      name: 'Jeremiah Owoade',
      email: 'jeremih.devv@gmail.com',
      role: 'ENGINEER',
    },
    {
      id: 2,
      name: 'Livi Akermn',
      email: 'captainlevi@gmail.com',
      role: 'ADMIN',
    },
    {
      id: 3,
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      role: 'INTERN',
    },
    {
      id: 4,
      name: 'Alice Wonderland',
      email: 'alice@example.com',
      role: 'INTERN',
    },
    {
      id: 5,
      name: 'Bob Builder',
      email: 'bob@example.com',
      role: 'INTERN',
    },
  ];

  findAll(role?: 'INTERN' | 'ENGINEER' | 'ADMIN') {
    if (role) {
      const rolesArray = this.users.filter((user) => user.role === role);
      if (rolesArray.length === 0) {
        throw new NotFoundException('User role not found');
      }
      return rolesArray;
    }
    return this.users;
  }

  findOne(id: number) {
    const user = this.users.find((user) => user.id === id);

    if (!user) throw new NotFoundException('User not found');

    return user;
  }

  create(createUserDto: CreateUserDto) {
    const usersByHighestId = [...this.users].sort((a, b) => b.id - a.id);
    const newUser = {
      id: usersByHighestId[0].id + 1,
      ...createUserDto,
    };
    this.users.push(newUser);
    return newUser;
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    this.users = this.users.map((user) => {
      if (user.id === id) {
        return { ...user, ...updateUserDto };
      }
      return user;
    });
    return this.findOne(id);
  }

  delete(id: number) {
    const removedUser = this.findOne(id);
    this.users = this.users.filter((user) => user.id !== id);

    return removedUser;
  }
}
